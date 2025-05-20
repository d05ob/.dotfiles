

/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "MesloLGS Nerd Font:size=12" };
static const char dmenufont[]       = "MesloLGS Nerd Font:size=12";

static const char col_bg[]     = "#1e1e2e"; // dark bluish background
static const char col_fg[]     = "#cdd6f4"; // light foreground
static const char col_border[] = "#89b4fa"; // blue border for active
static const char col_inactive_border[] = "#313244"; // darker inactive border
static const char col_sel_bg[] = "#1e1e2e"; // selected tag bg
static const char col_sel_fg[] = "#f5c2e7"; // selected tag fg (pinkish)

static const char *colors[][3] = {
    /*               fg          bg          border           */
    [SchemeNorm] = { col_fg,     col_bg,     col_inactive_border },
    [SchemeSel]  = { col_sel_fg, col_sel_bg, col_border          },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "st",       NULL,       NULL,       0,            0,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
    "dmenu_run",
    "-m", dmenumon,
    "-fn", dmenufont,
    "-nb", col_bg,       // normal background (same as dwm bg)
    "-nf", col_fg,       // normal foreground (same as dwm fg)
    "-sb", col_sel_bg,   // selected background (same as active window bg)
    "-sf", col_sel_fg,   // selected foreground (same as active window fg)
    NULL
};
static const char *termcmd[]  = { "st", NULL };
static const char *browsercmd[]  = { "firefox", NULL };
static const char *explorercmd[]  = { "thunar", NULL };
static const char *discordcmd[]  = { "discord", NULL };

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
    { 0,          XF86XK_MonBrightnessUp,      spawn,          SHCMD("brightnessctl set +10%") },
    { 0,        XF86XK_MonBrightnessDown,      spawn,          SHCMD("brightnessctl set 10%-") },
    { 0,         XF86XK_AudioRaiseVolume,      spawn,          SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +1%") },
    { 0,         XF86XK_AudioLowerVolume,      spawn,          SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -1%") },
    { 0,         XF86XK_AudioMute,             spawn,          SHCMD("pactl set-sink-mute @DEFAULT_SINK@ toggle") },
    { MODKEY,                        XK_backslash,      spawn,          SHCMD("scrot -s ~/Pictures/screenshot_%Y-%m-%d_%H-%M-%S.png -e 'xclip -selection clipboard -t image/png -i $f'") },
    { MODKEY|ShiftMask,                XK_backslash,      spawn,          SHCMD("scrot ~/Pictures/screenshot_%Y-%m-%d_%H-%M-%S.png -e 'xclip -selection clipboard -t image/png -i $f'") },
    { MODKEY|ControlMask, XK_backslash, spawn, SHCMD("pgrep -x ffmpeg || ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 ~/Videos/screenrecord_$(date +%Y-%m-%d_%H-%M-%S).mp4") },
    { MODKEY|ControlMask, XK_End, spawn, SHCMD("pkill -INT ffmpeg && xclip -selection clipboard -t video/mp4 -i $(ls -t ~/Videos/screenrecord_*.mp4 | head -n 1)") },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
    { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_d,      spawn,          {.v = discordcmd } },
	{ MODKEY,                       XK_n,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = explorercmd } },
	{ MODKEY,                  XK_Return,      spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                   XK_space,      togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
