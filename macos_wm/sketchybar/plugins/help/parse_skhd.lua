#!/usr/bin/env lua
-- Parse skhd config into TSV files consumed by toggle_help.sh.
-- A binding is emitted only when preceded by a `#? <description>` marker.
-- Mode-switch lines (`mode < KEY ; target`) are emitted automatically.

local HOME = os.getenv("HOME") or ""
local SKHD_DIR = HOME .. "/.config/skhd"
local CACHE_DIR = HOME .. "/.cache/sketchybar/help"
local SOURCES = { SKHD_DIR .. "/skhdrc" }
local BINDINGS_PATH = CACHE_DIR .. "/bindings.tsv"
local SWITCHES_PATH = CACHE_DIR .. "/switches.tsv"

local VALID_MODES = {
  default = true, stack = true, display = true,
  window = true, resize = true, inst = true,
}

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function squeeze(s)
  return (s:gsub("%s+", " "))
end

local function file_exists(path)
  local f = io.open(path, "r")
  if f then f:close() return true end
  return false
end

local function split_modes(modes_csv)
  local out = {}
  for raw_mode in (modes_csv .. ","):gmatch("([^,]+),") do
    local m = trim(raw_mode)
    if VALID_MODES[m] then out[#out + 1] = m end
  end
  return out
end

os.execute("mkdir -p " .. CACHE_DIR)

-- Dedup by (mode, keys) so the last definition wins, matching skhd.
local function make_collector()
  local items, by_key = {}, {}
  return {
    add = function(mode, keys, value)
      local k = mode .. "\0" .. keys
      local i = by_key[k]
      if i then
        items[i] = { mode, keys, value }
      else
        items[#items + 1] = { mode, keys, value }
        by_key[k] = #items
      end
    end,
    items = function() return items end,
  }
end

local bindings = make_collector()
local switches = make_collector()

local function emit_binding(modes_csv, keys, desc)
  for _, m in ipairs(split_modes(modes_csv)) do
    bindings.add(m, keys, desc)
  end
end

local function emit_switch(modes_csv, keys, target)
  if not VALID_MODES[target] then return end
  for _, m in ipairs(split_modes(modes_csv)) do
    switches.add(m, keys, target)
  end
end

local function parse_file(path)
  if not file_exists(path) then return end
  local f = assert(io.open(path, "r"), "cannot read " .. path)

  local pending = nil
  local in_continuation = false
  local in_bracket = false

  for raw in f:lines() do
    local line = (raw:gsub("\r$", ""))
    local stripped = trim(line)

    repeat
      if in_bracket then
        if stripped:find("]", 1, true) then in_bracket = false end
        break
      end

      if in_continuation then
        if not line:match("\\%s*$") then in_continuation = false end
        break
      end

      local marker = stripped:match("^#%?%s*(.*)$")
      if marker then
        pending = trim(marker)
        if pending == "" then pending = nil end
        break
      end

      if stripped == "" then
        pending = nil
        break
      end

      if stripped:sub(1, 1) == "#" then
        break
      end

      local head = line
      if head:match("\\%s*$") then
        in_continuation = true
        head = head:gsub("\\%s*$", "")
      end

      local modes_csv, rest
      local mode_part, after = head:match("^%s*([%a_,%s]+)<%s*(.*)$")
      if mode_part then
        modes_csv = trim(squeeze(mode_part)):gsub("%s", "")
        rest = after
      else
        modes_csv = "default"
        rest = trim(head)
      end

      local keys, sep = rest:match("^([^:;%[]+)([:;%[])")
      if not keys then
        pending = nil
        break
      end
      keys = squeeze(trim(keys))

      if sep == "[" then
        if not head:find("]", 1, true) then in_bracket = true end
        pending = nil
        break
      end

      if sep == ";" then
        local target = rest:match(";%s*([%a_]+)")
        if target then emit_switch(modes_csv, keys, target) end
        pending = nil
        break
      end

      if pending then emit_binding(modes_csv, keys, pending) end
      pending = nil
    until true
  end

  f:close()
end

for _, src in ipairs(SOURCES) do
  parse_file(src)
end

local bindings_out = assert(io.open(BINDINGS_PATH, "w"),
  "cannot write " .. BINDINGS_PATH)
local switches_out = assert(io.open(SWITCHES_PATH, "w"),
  "cannot write " .. SWITCHES_PATH)

for _, e in ipairs(bindings.items()) do
  bindings_out:write(string.format("%s\t%s\t%s\n", e[1], e[2], e[3]))
end
for _, e in ipairs(switches.items()) do
  switches_out:write(string.format("%s\t%s\t%s\n", e[1], e[2], e[3]))
end

bindings_out:close()
switches_out:close()
