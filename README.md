# Dotfiles

This is my dotfiles for an Ubuntu 22.04 OS machine. It uses `GNU Stow` for a
dead easy dotfiles management. The following chunk of text shows an example of
how it works:

```txt
➜ tree -L 1 ~/dotfiles
.
└── foo

➜ cd ~/dotfiles
➜ stow .
➜ tree -L 1 ~
.
├─ foo --> ~/dotfiles/foo
├─ ...
├─ ...
└─ dotfiles
```

> Note that many packages from APT may be really outdated, so apps like
> Neovim and Firefox is not included in `Packages` and should be manually
> compiled in order to get the most recent versions.

> [Optionally, remove Snap and replace it with Flatpak](https://github.com/popey/unsnap)

```bash
cd ~
git clone https://github.com/nicolasZhao1908/dotfiles
sudo apt update
sudo apt upgrade
grep -vE "^#" Packages | xargs sudo apt install
stow .
```

## Appearance

- [`i3wm`](https://i3wm.org/)
- [`Picom`](https://github.com/yshui/picom)
- [`lxappearance`](https://github.com/lxde/lxappearance), GTK theme switcher GUI
- [`Polybar`](https://github.com/polybar/polybar/), tasks bar
- `NotoSansMono Nerd Font`, font family.

## Shell

- [`zsh`](https://www.zsh.org/)
- [`zsh-autosuggestion`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`zsh-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`starship prompt`](https://starship.rs)
- [`alacritty`](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
- [`tmux`](https://github.com/tmux/tmux/wiki/Installing)
- [`tpm`](https://github.com/tmux-plugins/tpm)

## Core utilities

| Name                | Description                           |
| ------------------- | ------------------------------------- |
| xinit               | Initialize programs before WM starts. |
| arandr              | `xrandr` GUI.                         |
| Network Manager     | Manages network connections.          |
| nm-applet           | Network manager systray.              |
| lightdm             | Login Manager .                       |
| pactl               | PulseAudio volume control.            |
| pavucontrol         | PulseAudio GUI.                       |
| xfce4-power-manager | Power Manager.                        |
| brightnessctl       | Brightness control.                   |
| libmtp              | Media Transfer Protocol               |
| dunst               | Notification Manager                  |
| fzf                 | Fuzzy finder.                         |
| task warrior        | Todo list CLI.                        |
| gh                  | Github command-line tool.             |
| maim                | Screenshot utility.                   |
| feh                 | Wallpaper manager and image viewer.   |
| zathura             | PDF viewer.                           |
| exa                 | `ls` replacement.                     |
| bat                 | `cat` replacement.                    |
| zoxide              | `cd` replacement.                     |
| ripgrep             | `grep` replacement.                   |

## Core Apps

- [`Firefox developer`](https://www.mozilla.org/en-US/firefox/developer/)
- [`Thunar`](https://docs.xfce.org/xfce/thunar/start), xfce file manager GUI.
- [`Obsidian`](https://obsidian.md/), note taking.
  - [`Excalidraw plugin`](https://github.com/zsviczian/obsidian-excalidraw-plugin)
- [`Rofi`](https://github.com/davatorium/rofi), application launcher.
- [`Syncthing`](https://syncthing.net/), synchronization server.
- [`Discord`](https://discord.com/)
- [`VLC`](https://www.videolan.org/vlc/)

## IDE

[Neovim](https://neovim.io/)

| Plugin name      | Description                              |
| ---------------- | ---------------------------------------- |
| Lazy             | Plugin manager                           |
| Mason            | Language/Linter/Formatter Server manager |
| Treesitter       | Syntax highlighting                      |
| Telescope        | Fuzzy finder                             |
| Null-ls          | Formatting and linter config             |
| LSP Zero         | LSP configuration                        |
| nvim-cmp         | Autcompletion                            |
| Tmux-Neovim      | Neovim like tmux navigation              |
| Nvim-tree        | File tree                                |
| Harpoon          | Quick file switcher                      |
| Lualine          | Status bar                               |
| gruvbox_material | Theme                                    |

## Virtualization

- [`KVM`](https://ubuntu.com/blog/kvm-hyphervisor), Linux native hypervisor.
- [`Virt-Manager`](https://virt-manager.org/), KVM-Qemu GUI.

## Docker

- [`docker`](https://docs.docker.com/engine/install/)
- [`docker-compose`](https://docs.docker.com/compose/install/)

## Language Specific

### Rust

[`rust`](https://www.rust-lang.org/learn/get-started)

- `cargo-watch`, tests/runs/builds/lints code on change.
- `cargo-expand`, expands Rust macros.
- `sccache`, cache for faster build time.

### Python

- [`pyenv`](https://github.com/pyenv/pyenv#automatic-installer)

### Node js

- [`nvm`](https://github.com/nvm-sh/nvm), node version manager.
- [`pnpm`](https://pnpm.io/), `npm` alternative.

## Research and note taking

### Zotero

- [`zotero`](https://www.zotero.org/), reference manager.
- [`zotero-storage-scanner`](https://github.com/retorquere/zotero-storage-scanner)
- [`zotfile`](https://github.com/jlegewie/zotfile)

_Configuration_: `~/.zotero/zotero/<user_id>.default/pref.js`

```javascript
user_pref("app.update.download.attempts", 0);
user_pref("app.update.elevate.attempts", 0);
user_pref(
  "app.update.lastUpdateTime.addon-background-update-timer",
  1681664188
);
user_pref("app.update.lastUpdateTime.background-update-timer", 1681664372);
user_pref(
  "app.update.lastUpdateTime.blocklist-background-update-timer",
  1681664308
);
user_pref("app.update.lastUpdateTime.search-engine-update-timer", 1681664068);
user_pref("app.update.lastUpdateTime.xpi-signature-verification", 1681664438);
user_pref("app.update.postupdate", true);
user_pref("browser.cache.disk.capacity", 358400);
user_pref("browser.cache.disk.filesystem_reported", 1);
user_pref("browser.dom.window.dump.enabled", false);
user_pref("browser.preferences.animateFadeIn", false);
user_pref("extensions.blocklist.pingCountVersion", -1);
user_pref("extensions.databaseSchema", 27);
user_pref("extensions.lastAppBuildId", "20230312173626");
user_pref("extensions.lastAppVersion", "6.0.23");
user_pref("extensions.lastPlatformVersion", "60.9.0");
user_pref("extensions.pendingOperations", false);
user_pref("extensions.systemAddonSet", '{"schema":1,"addons":{}}');
user_pref("extensions.ui.dictionary.hidden", true);
user_pref("extensions.ui.locale.hidden", true);
user_pref(
  "extensions.zotero.Knowledge4Zotero.citeFormat",
  '{"mode":"bibliography","contentType":"","id":"http://www.zotero.org/styles/chicago-note-bibliography","locale":""}'
);
user_pref("extensions.zotero.Knowledge4Zotero.mainKnowledgeID", 45);
user_pref("extensions.zotero.Knowledge4Zotero.recentMainNoteIds", "45");
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[ExportMDFileHeader]",
  '${await new Promise(async (r) => {\n  let header = {};\n  header.tags = noteItem.getTags().map((_t) => _t.tag);\n  header.parent = noteItem.parentItem? noteItem.parentItem.getField("title") : "";\n  header.collections = (\n    await Zotero.Collections.getCollectionsContainingItems([\n      (noteItem.parentItem || noteItem).id,\n    ])\n  ).map((c) => c.name);\n  r(JSON.stringify(header));\n})}\n'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[ExportMDFileName]",
  '${(noteItem.getNoteTitle ? noteItem.getNoteTitle().replace(/[/\\\\?%*:|"<> ]/g, "-") + "-" : "")}${noteItem.key}.md'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[Item] collect annotations by color",
  '${await new Promise(async (r) => {\n  async function getAnnotation(item) {\n    try {\n      if (!item || !item.isAnnotation()) {\n        return null;\n      }\n      let json = await Zotero.Annotations.toJSON(item);\n      json.id = item.key;\n      delete json.key;\n      for (let key in json) {\n        json[key] = json[key] || "";\n      }\n      json.tags = json.tags || [];\n      return json;\n    } catch (e) {\n      Zotero.logError(e);\n      return null;\n    }\n  }\n\n  async function getAnnotationsByColor(_item, colorFilter) {\n    const annots = _item.getAnnotations().filter(colorFilter);\n    if (annots.length === 0) {\n      return {\n        html: "",\n      };\n    }\n    let annotations = [];\n    for (let annot of annots) {\n      const annotJson = await getAnnotation(annot);\n      annotJson.attachmentItemID = _item.id;\n      annotations.push(annotJson);\n    }\n\n    if (!editor) {\n      alert("No active note editor detected. Please open workspace.");\n      return r("");\n    }\n    await editor.importImages(annotations);\n    return Zotero.EditorInstanceUtilities.serializeAnnotations(annotations);\n  }\n\n  const attachments = Zotero.Items.get(topItem.getAttachments()).filter((i) =>\n    i.isPDFAttachment()\n  );\n  let res = "";\n  const colors = ["#ffd400", "#ff6666", "#5fb236", "#2ea8e5", "#a28ae5"];\n  const colorNames = ["Yellow", "Red", "Green", "Blue", "Purple"];\n  for (let attachment of attachments) {\n    res += `<h1>${attachment.getFilename()}</h1>`;\n    for (let i in colors) {\n      const renderedAnnotations = (\n        await getAnnotationsByColor(\n          attachment,\n          (_annot) => _annot.annotationColor === colors[i]\n        )\n      ).html;\n      if (renderedAnnotations) {\n        res += `<h2><p style="background-color:${colors[i]};">${colorNames[i]} Annotations</p></h2>\n${renderedAnnotations}`;\n      }\n    }\n    const renderedAnnotations = (\n      await getAnnotationsByColor(\n        attachment,\n        (_annot) => !colors.includes(_annot.annotationColor)\n      )\n    ).html;\n    if (renderedAnnotations) {\n      res += `<h2><p>Other Annotations</p></h2>\n${renderedAnnotations}`;\n    }\n  }\n  r(res);\n})}'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[Item] collect annotations by tag",
  '// @beforeloop-begin\n${(()=>{\nsharedObj.tagRaw = prompt("Please input tags. Split with \'\',:", "");\nreturn "";\n})()}\n// @beforeloop-end\n// @default-begin\n${await new Promise(async (r) => {\n  async function getAnnotation(item) {\n    try {\n      if (!item || !item.isAnnotation()) {\n        return null;\n      }\n      let json = await Zotero.Annotations.toJSON(item);\n      json.id = item.key;\n      delete json.key;\n      for (let key in json) {\n        json[key] = json[key] || "";\n      }\n      json.tags = json.tags || [];\n      return json;\n    } catch (e) {\n      Zotero.logError(e);\n      return null;\n    }\n  }\n\n  async function getAnnotationsByTag(_item, tag) {\n    let annots = _item.getAnnotations();\n    annots = tag.length? \n      annots.filter((_annot) => _annot.getTags().map(_t=>_t.tag).includes(tag)) :\n      annots;\n    let annotations = [];\n    for (let annot of annots) {\n      const annotJson = await getAnnotation(annot);\n      annotJson.attachmentItemID = _item.id;\n      annotations.push(annotJson);\n    }\n    if (!editor) {\n      alert("No active note editor detected. Please open workspace.");\n      return r("");\n    }\n    await editor.importImages(annotations);\n      return Zotero.EditorInstanceUtilities.serializeAnnotations(annotations);\n    }\n  const attachments = Zotero.Items.get(topItem.getAttachments()).filter((i) =>\n    i.isPDFAttachment()\n  );\n  let res = "";\n  if(!sharedObj.tagRaw){\n    return;\n  }\n  res += `<h1>${topItem.getField("title")}</h1>`;\n  for (let attachment of attachments) {\n    res += `<h2>${attachment.getFilename()}</h2>`;\n    for(tag of sharedObj.tagRaw.split(",").filter(t=>t.length)){\n      res += `<h3>Tag: ${tag}</h3>`;\n      const tags = (await getAnnotationsByTag(attachment, tag)).html\n      res += tags ? tags : "<p>No result</p>";\n  }\n  }\n  r(res);\n})}\n// @default-end'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[Item] item-notes with metadata",
  '<h1>${topItem.getField("title")}</h1>\n<h2 style="color:red; background-color: #efe3da;">💡 Meta Data</h2>\n<table>\n    <tr>\n        <th style="background-color:#dbeedd;">\n            <p style="text-align: right">Title </p>\n        </th>\n        <td style="background-color:#dbeedd;">\n            ${topItem.getField(\'title\')}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#f3faf4;">\n            <p style="text-align: right">Journal </p>\n        </th>\n        <td style="background-color:#f3faf4;">\n            ${topItem.getField(\'publicationTitle\')}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#dbeedd;">\n            <p style="text-align: right">1<sup>st</sup> Author </p>\n        </th>\n        <td style="background-color:#dbeedd;">\n            ${topItem.getField(\'firstCreator\')}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#f3faf4;">\n            <p style="text-align: right">Authors </p>\n        </th>\n        <td style="background-color:#f3faf4;">\n            ${topItem.getCreators().map((v)=>v.firstName+" "+v.lastName).join("; ")}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#dbeedd;">\n            <p style="text-align: right">Pub. date </p>\n        </th>\n        <td style="background-color:#dbeedd;">\n            ${topItem.getField(\'date\')}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#f3faf4;">\n            <p style="text-align: right">DOI </p>\n        </th>\n        <td style="background-color:#f3faf4;">\n            <a href="https://doi.org/${topItem.getField(\'DOI\')}">${topItem.getField(\'DOI\')}</a>\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#dbeedd;">\n            <p style="text-align: right">Archive </p>\n        </th>\n        <td style="background-color:#dbeedd;">\n            ${topItem.getField(\'archive\')}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#f3faf4;">\n            <p style="text-align: right">Archive Location </p>\n        </th>\n        <td style="background-color:#f3faf4;">\n            ${topItem.getField(\'archiveLocation\')}\n        </td>\n    </tr>\n    <tr>\n        <th style="background-color:#dbeedd;">\n            <p style="text-align: right">Call No. </p>\n        </th>\n        <td style="background-color:#dbeedd;">\n            ${topItem.getField(\'callNumber\')}\n        </td>\n    </tr>\n</table>\n${itemNotes.map((noteItem)=>{\nconst noteLine = `<h2  style="color:red; background-color: #efe3da;">📜 Note:  <a href="${Zotero.BetterNotes.knowledge.getNoteLink(noteItem)}" rel="noopener noreferrer nofollow">${noteItem.key}</a></h2>\n<blockquote>\n    ${noteItem.getNote()}\n    <p style="background-color: pink;"><strong>Merge Date: </strong> ${new Date().toISOString().substr(0,10)+" "+ new Date().toTimeString()}</p>\n</blockquote>\n<p style="color:red; background-color: #efe3da;"><strong>📝 Comments</strong></p>\n<blockquote>\n    <p>Make your comments</p>\n    <p></p>\n</blockquote>`;\ncopyNoteImage(noteItem);\nreturn noteLine;\n}).join("\\n")}\n'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[Item] note links",
  '<p><a href="${Zotero.BetterNotes.knowledge.getNoteLink(topItem)}">${topItem.getNoteTitle().trim() ? topItem.getNoteTitle().trim() : Zotero.BetterNotes.knowledge.getNoteLink(topItem)}</a></p>'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[QuickBackLink]",
  '<p>Referred in <a href="${Zotero.BetterNotes.knowledge.getNoteLink(noteItem)}?ignore=1&line=${lineIndex}" rel="noopener noreferrer nofollow">${noteItem.getNoteTitle().trim() ? noteItem.getNoteTitle().trim() : "Main Note"}${sectionName?`/${sectionName}`:""}</a></p>'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[QuickImport]",
  '<blockquote>\n<p><strong>Linked Note:</strong></p>\n${subNoteLines.join("")}\n</blockquote>'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[QuickInsert]",
  '<p><a href="${link}" rel="noopener noreferrer nofollow">${subNoteItem.getNoteTitle().trim() ? subNoteItem.getNoteTitle().trim() : link}</a></p>'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[QuickNoteV4]",
  '${await new Promise(async (r) => {\nlet res = ""\nif(annotationItem.annotationComment){\nres += await Zotero.BetterNotes.NoteParse.parseMDToHTML(annotationItem.annotationComment);\n}\nres += await Zotero.BetterNotes.NoteParse.parseAnnotationHTML(noteItem, [annotationItem], true);\nr(res);})}'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.template.[Text] table",
  '${(() => {\nconst size = prompt("Table Size(row*column):", "4*3");\nif (!size) {\nreturn "";\n}\nconst row = Number(size.split("*")[0]);\nconst col = Number(size.split("*")[1]);\nif (!row || !col) {\nreturn "";\n}\nconst makeHeadCell = () => "<th>\n</th>";\nconst makeHead = () =>\n`<tr>${[...Array(col).keys()].map(makeHeadCell).join("\n")}</tr>`;\nconst makeCell = () => "<td>\n</td>";\nconst makeRow = () =>\n`<tr>${[...Array(col).keys()].map(makeCell).join("\n")}</tr>`;\nreturn `<table><thead>${makeHead()}</thead>\n${\nrow > 1\n? "<tbody>" +\n[...Array(row - 1).keys()].map(makeRow).join("\n") +\n"</tbody>"\n: ""\n}\n</table>`;\n})()}'
);
user_pref(
  "extensions.zotero.Knowledge4Zotero.templateKeys",
  '[{"name":"[QuickBackLink]","disabled":false},{"name":"[QuickInsert]","disabled":false},{"name":"[QuickImport]","disabled":false},{"name":"[QuickNoteV4]","disabled":false},{"name":"[ExportMDFileName]","disabled":false},{"name":"[ExportMDFileHeader]","disabled":false},{"name":"[Item] item-notes with metadata","disabled":false},{"name":"[Item] collect annotations by color","disabled":false},{"name":"[Item] collect annotations by tag","disabled":false},{"name":"[Item] note links","disabled":false},{"name":"[Text] table","disabled":false}]'
);
user_pref("extensions.zotero.dataDir", "/home/nicozhao1908/Zotero");
user_pref(
  "extensions.zotero.export.lastTranslator",
  "f895aa0d-f28e-47fe-b247-2ea77c6ed583"
);
user_pref(
  "extensions.zotero.export.translatorSettings",
  '{"exportNotes":false,"exportFileData":false,"useJournalAbbreviation":false,"keepUpdated":false,"worker":true,"includeAnnotations":false}'
);
user_pref(
  "extensions.zotero.findPDFs.resolvers",
  '{     "name":"Sci-Hub",     "method":"GET",     "url":"https://sci-hub.st/{doi}",     "mode":"html",     "selector":"#pdf",     "attribute":"src",     "automatic":true }'
);
user_pref("extensions.zotero.firstRun.skipFirefoxProfileAccessCheck", true);
user_pref("extensions.zotero.firstRun2", false);
user_pref("extensions.zotero.firstRunGuidanceShown.quickFormat", true);
user_pref("extensions.zotero.ignoreLegacyDataDir.auto", true);
user_pref("extensions.zotero.lastViewedFolder", "L1");
user_pref("extensions.zotero.newItemTypeMRU", "book");
user_pref(
  "extensions.zotero.pane.persist",
  '{"zotero-reader-sidebar-pane":{"collapsed":"true","width":"240"},"zotero-collections-pane":{"width":"246"},"zotero-tags-splitter":{"state":""},"zotero-tag-selector-container":{"height":"421"},"zotero-collections-splitter":{"state":""},"zotero-layout-switcher":{"orient":"horizontal"},"zotero-items-pane":{"width":"1358"},"zotero-items-splitter":{"state":"collapsed","orient":"horizontal"},"zotero-item-pane":{"width":"338","height":"300"},"zotero-context-splitter":{"state":""},"zotero-context-pane":{"width":"720"},"zotero-context-splitter-stacked":{"state":"open"},"zotero-context-pane-inner":{"height":"503"}}'
);
user_pref("extensions.zotero.prefVersion", 6);
user_pref(
  "extensions.zotero.recentSaveTargets",
  '[{"id":"C1","sessionID":"ZxTqNrZF"},{"id":"C3","sessionID":"Lr0Ve8uA"},{"id":"C11","sessionID":"K2YAndg2"},{"id":"L1","sessionID":"T4o114aT"}]'
);
user_pref(
  "extensions.zotero.sourceList.persist",
  '{"L1":true,"P1":false,"C23":true}'
);
user_pref("extensions.zotero.sync.reminder.setUp.enabled", false);
user_pref("extensions.zotero.sync.reminder.setUp.lastDisplayed", 1676128730);
user_pref("extensions.zotero.translators.better-bibtex.autoExportDelay", 2);
user_pref(
  "extensions.zotero.translators.better-bibtex.citekeyFormat",
  "authEtal2(sep=_).lower + year"
);
user_pref(
  "extensions.zotero.translators.better-bibtex.citekeyFormatEditing",
  "authEtal2(sep=_).lower + year"
);
user_pref("extensions.zotero.translators.better-bibtex.platform", "lin");
user_pref("extensions.zotero.useDataDir", true);
user_pref("extensions.zotero.zoteroscihub.automatic_pdf_download", true);
user_pref("extensions.zotero.zoteroscihub.scihub_url", "https://sci-hub.ru/");
user_pref("extensions.zoteroOpenOfficeIntegration.skipInstallation", true);
user_pref("extensions.zotfile.source_dir_ff", false);
user_pref("extensions.zotfile.version", "5.1.2");
user_pref("gecko.handlerService.migrated", true);
user_pref("intl.accept_languages", "en-US, en");
user_pref("media.gmp.storage.version.observed", 1);
user_pref("network.cookie.prefsMigrated", true);
user_pref("network.predictor.cleaned-up", true);
user_pref("places.history.expiration.transient_current_max_pages", 104858);
user_pref("signon.importedFromSqlite", true);
```

### Chinese keyboard input

```bash
sudo apt install fcitx5 \
fcitx5-chinese-addons \
fcitx5-frontend-gtk4 fcitx5-frontend-gtk3 fcitx5-frontend-gtk2 \
fcitx5-frontend-qt5 \
fcitx5-module-cloudpinyin
```

#### Dictionary installation

```bash
# download dictionary
wget https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict

# move to directory
mkdir -p ~/.local/share/fcitx5/pinyin/dictionaries/
mv zhwiki-20220416.dict ~/.local/share/fcitx5/pinyin/dictionaries/
```

#### Nord Theme

```bash
git clone https://github.com/tonyfettes/fcitx5-nord.git
mkdir -p ~/.local/share/fcitx5/themes/
cd fcitx5-nord
cp -r Nord-Light/ ~/.local/share/fcitx5/themes/

# ~/.config/fcitx5/conf/classicui.conf
Theme=Nord-Light

fcitx5 -r
```

### Latex packages

- `texlive`, Latex's distro.
- `biber`
- `latexmk`, Latex's Make
- `texlive-luatex`, Latex's compiler
- `texlive-lang-spanish`
- `texlive-latex-extra`
- `texlive-fonts-extra`

## Other tools

| Name      | Description                                                            |
| --------- | ---------------------------------------------------------------------- |
| Autofirma | Electronic signature tool for Spanish government documents.            |
| slidev    | Presentation tool with Markdown support.                               |
| pandoc    | A "swiss army knife" file format converter, with support for Markdown. |
