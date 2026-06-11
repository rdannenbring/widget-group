# Widget Group

A [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) (DMS) bar plugin that adds a single **collapsible button** to the bar which expands to reveal a group of other widgets inline — each keeping its own live pill and working popout.

> Status: **beta** (v0.5.0)

## Screenshots

![Widget Group expanded on the bar](assets/screenshot.png)

![Settings](assets/settings.png)

## Why

Bars get crowded. Widget Group lets you fold a cluster of widgets behind one button and reveal them on demand. Because the members render **inline in the bar window** (not in a separate popout), each member's own popout positions correctly below the bar — exactly as if it were placed directly on the bar.

## Features

- **Group any widget plugins** behind one bar button; expand/collapse with a click.
- Members are the **real widgets** — live pills and fully working popouts.
- **Expand direction**: left/right on horizontal bars, up/down on vertical bars.
- **Button display**: icon, label, or both; choose the button icon from a searchable Material icon picker.
- **Auto-collapse** (optional): collapse after a configurable delay (1–30s), with an option to only start the timer once the mouse leaves the expanded group.
- **Multiple groups** via variants — each is a separate bar widget.
- Add / reorder / change / remove members; collapsible editor.

## Requirements

- DankMaterialShell (quickshell-based) with the plugin system.
- The plugins you want to group must be **widget**-type plugins and **enabled**.

## Install

### From the DMS plugin registry (once published)

```sh
dms plugins install widgetGroup
```

### Manual

Clone into your DMS plugins directory:

```sh
git clone https://github.com/rdannenbring/widget-group.git \
  ~/.config/DankMaterialShell/plugins/widgetGroup
```

Then enable it in **DMS Settings → Plugins**, configure a group, and add it to your bar via **Bar Settings → Add Widget**.

## Usage

1. Enable the widget plugins you want to group.
2. Enable Widget Group in **Settings → Plugins** and open its settings.
3. Create a group, then click it to edit (button icon/label/display, expand direction, auto-collapse).
4. Add member widgets; click a member to change its plugin, reorder, or remove.
5. **Bar Settings → Add Widget** to place the group on your bar.

On the bar, click the button (▾/▴ or ‹/›) to show or hide the members.

## Notes & caveats

- Only **widget** plugins can be members (they have a bar pill + popout). Daemon/launcher/desktop plugins aren't applicable.
- With **auto-collapse → only after mouse leaves**: if you open a member's popout and move onto that popout window, the group counts it as "mouse left" and collapses after the delay. The member's popout itself stays open.

## License

[MIT](LICENSE)
