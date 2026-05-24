local notes = {}

local function import(root)

    for __, file in ipairs(require(root..".".."F077-sai-index")) do
        --
        table.insert(notes, { name = file, sound = { filename = root.."/audios/"..file } })
    end
end

for name, __ in pairs(mods) do if pcall(import, "__"..name.."__") then log("imported '"..name.."'") end end

table.insert(data.raw["programmable-speaker"]["programmable-speaker"].instruments, { name = "simple-audio-importer", notes = notes })