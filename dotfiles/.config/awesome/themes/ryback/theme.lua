--[[

     Steamburn Awesome WM theme 3.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}

-- Nord colors
theme.nord0  = "#2E3440"
theme.nord1  = "#3B4252"
theme.nord2  = "#434C5E"
theme.nord3  = "#4C566A"
theme.nord4  = "#D8DEE9"
theme.nord5  = "#E5E9F0"
theme.nord6  = "#ECEFF4"
theme.nord7  = "#8FBCBB"
theme.nord8  = "#88C0D0"
theme.nord9  = "#81A1C1"
theme.nord10 = "#5E81AC"
theme.nord11 = "#BF616A"
theme.nord12 = "#D08770"
theme.nord13 = "#EBCB8B"
theme.nord14 = "#A3BE8C"
theme.nord15 = "#B48EAD"

theme.fg_normal = theme.nord4
theme.fg_focus = theme.nord4
theme.fg_urgent = theme.nord12

theme.bg_normal = theme.nord0
theme.bg_focus = theme.nord0
theme.bg_urgent = theme.nord0

theme.border_normal = theme.nord0
theme.border_focus = theme.nord9
theme.border_marked = theme.nord9

theme.taglist_fg_focus = theme.nord0
theme.taglist_bg_focus = theme.nord9

theme.tasklist_fg_focus = theme.nord9
theme.tasklist_bg_focus = theme.nord0

theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/ryback"
theme.wallpaper                                 = theme.dir .. "/wallpaper.jpg"
theme.font = "Source Code Pro 10"
theme.wibar_height = dpi(22)
theme.useless_gap = dpi(0)

theme.border_width                              = dpi(2)
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray = theme.tasklist_fg_focus

-- Textclock
local mytextclock = wibox.widget.textclock(markup(gray, "| ") .. "%d %b %H:%M:%S" .. markup(gray, " |"))
mytextclock.font = theme.font
mytextclock.refresh = 1

-- System Load
-- local sys = lain.widget.sysload({
--     settings = function()
--         widget:set_markup(markup.font(theme.font, markup(gray, "SYS ") .. load_1))
--     end
-- })

-- CPU Load
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, "CPU ") .. cpu_now.usage))
    end
})

-- Memory used
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, "MEM ") .. mem_now.used))
    end
})

-- Battery
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc
        if bat_now.ac_status == 1 then
            perc = perc .. "|P"
        else
            perc = perc .. "|U"
        end
        widget:set_markup(markup.font(theme.font, markup(gray, "BAT ") .. perc))
    end
})

-- Net checker
local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then net_state = "ON"
        else net_state = "OFF" end
        widget:set_markup(markup.font(theme.font, markup(gray, "NET ") .. net_state))
    end
})

-- PulseAudio Volume
theme.volume = lain.widget.pulse({
        settings = function()
            vlevel = volume_now.right
            if volume_now.muted == "yes" then
                vlevel = vlevel .. "|M"
            end
            widget:set_markup(markup.font(theme.font, markup(gray, "VOL ") .. vlevel))
        end
})

-- Redshift
myredshift = wibox.widget.textbox()
lain.widget.contrib.redshift:attach(
    myredshift,
    function (active)
        if active then
            label = "ON"
        else
            label = "OFF"
        end
        myredshift:set_text("RS " .. label)
        myredshift:set_markup(markup.font(theme.font, markup(gray, "RS ") .. label))
    end
)
myredshift.font = theme.font

-- Keyboard Indicator
theme.mykeyboardlayout = awful.widget.keyboardlayout()
theme.mykeyboardlayout.widget.font = theme.font

-- Separators
local first = wibox.widget.textbox(markup.font("Source Code Pro 4", " "))
local spr   = wibox.widget.textbox(markup.font(theme.font, " "))

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function() awful.layout.inc(-1) end),
                           awful.button({}, 4, function() awful.layout.inc(1) end),
                           awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = theme.wibar_height })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            s.mytaglist,
            spr,
            s.mytxtlayoutbox,
            spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            cpu.widget,
            spr,
            mem.widget,
            spr,
            bat.widget,
            spr,
            net.widget,
            spr,
            myredshift,
            spr,
            theme.volume.widget,
            spr,
            mytextclock,
            theme.mykeyboardlayout
        },
    }
end

return theme
