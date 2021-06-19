local cmd = vim.cmd

local colors = require "themes/onedark"

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local light_grey = colors.light_grey
local grey = colors.grey
local grey_fg = colors.grey_fg
local red = colors.red
local line = colors.white
local nord_blue = colors.nord_blue
local blue = colors.blue
local purple = colors.purple

-- for guifg , bg

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end



-- mCustom Color 
local str_color = "#98C379"
local light_bg = "#292F36"
local dark_bg = "#1F262E"
local green  = "#7BE49F"
local blue      = "#81A1C1"
local yellow = "#EBCB8B"
local purple = "#8E79CD"
local lred = "#FFD7D7"
local dark_green = "#8FBCBB"

-- blankline
fg("IndentBlanklineChar", line)

-- misc --
fg("Keyword", yellow)
fg("Conditional", yellow)
fg("Repeat", yellow)
fg("Operator", yellow)
fg("String", str_color)
fg("Delimiter", lred)
fg("Type", green)
fg("Function", dark_green)
fg("Identifier", dark_green)
fg("LineNr", grey)
fg("Comment", grey)
fg("NvimInternalError", red)
fg("VertSplit", line)
fg("LineNr", white)
fg("CursorLineNr", yellow)
fg("EndOfBuffer", dark_green)

cmd("hi clear StatusLineNc")
fg("StatusLineNC", blue)

-- IndentLine

fg("IndentBlanklineChar",grey)

-- Tree Sitter

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- git signs ---
fg_bg("DiffAdd", nord_blue, "none")
fg_bg("DiffChange", one_bg2, "none")
fg_bg("DiffModified", nord_blue, "none")

-- NvimTree
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeVertSplit", dark_bg)
bg("NvimTreeVertSplit", dark_bg)

fg("NvimTreeRootFolder", dark_bg)
bg("NvimTreeNormal", dark_bg)
fg_bg("NvimTreeStatusline", dark_bg, dark_bg)
bg("NvimTreeStatuslineNc", dark_bg, dark_bg)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", line)

-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", red)
fg("LspDiagnosticsVirtualTextError", red)
fg("LspDiagnosticsSignWarning", yellow)
fg("LspDiagnosticsVirtualTextWarning", yellow)

-- info
fg("LspDiagnosticsSignInformation", green)
fg("LspDiagnosticsVirtualTextInformation", green)

-- hint
fg("LspDiagnosticsSignHint", purple)
fg("LspDiagnosticsVirtualTextHint", purple)

-- bufferline

fg_bg("BufferLineFill", grey_fg, dark_bg)
fg_bg("BufferLineBackground", light_grey, black2)

fg_bg("BufferLineBufferVisible", light_grey, black2)
fg_bg("BufferLineBufferSelected", white, "none")

cmd "hi BufferLineBufferSelected gui=bold"

-- tabs
fg_bg("BufferLineTab", light_grey, one_bg3)
fg_bg("BufferLineTabSelected", black2, nord_blue)
fg_bg("BufferLineTabClose", red, black)

fg_bg("BufferLineIndicator", black2, black2)
fg_bg("BufferLineIndicatorSelected", black, black)

-- separators
fg_bg("BufferLineSeparator", black2, black2)
fg_bg("BufferLineSeparatorVisible", black2, black2)
fg_bg("BufferLineSeparatorSelected", black2, black2)

-- modified buffers
fg_bg("BufferLineModified", red, black2)
fg_bg("BufferLineModifiedVisible", red, black2)
fg("BufferLineModifiedSelected", green)

-- close buttons
fg_bg("BufferLineCLoseButtonVisible", light_grey, black2)
fg_bg("BufferLineCLoseButton", light_grey, black2)
fg_bg("BufferLineCLoseButtonSelected", red, black)

-- dashboard

fg("DashboardHeader", grey_fg)
fg("DashboardCenter", grey_fg)
fg("DashboardShortcut", grey_fg)
fg("DashboardFooter", black)

-- basic
bg("Normal", light_bg)
