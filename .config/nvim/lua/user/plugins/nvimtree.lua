-- OR setup with some options
--
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local api = require('nvim-tree.api')

        local function on_attach(bufnr)
            local function name(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- Default mappings. Feel free to modify or remove as you wish.
            --
            -- BEGIN_DEFAULT_ON_ATTACH
            vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, name('CD'))
            vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, name('Open: In Place'))
            vim.keymap.set('n', '<C-k>', api.node.show_info_popup, name('Info'))
            vim.keymap.set('n', '<C-r>', api.fs.rename_sub, name('Rename: Omit Filename'))
            vim.keymap.set('n', '<C-t>', api.node.open.tab, name('Open: New Tab'))
            vim.keymap.set('n', '<C-v>', api.node.open.vertical, name('Open: Vertical Split'))
            vim.keymap.set('n', '<C-x>', api.node.open.horizontal, name('Open: Horizontal Split'))
            vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, name('Close Directory'))
            vim.keymap.set('n', '<CR>', api.node.open.edit, name('Open'))
            vim.keymap.set('n', '<Tab>', api.node.open.preview, name('Open Preview'))
            vim.keymap.set('n', '>', api.node.navigate.sibling.next, name('Next Sibling'))
            vim.keymap.set('n', '<', api.node.navigate.sibling.prev, name('Previous Sibling'))
            vim.keymap.set('n', '.', api.node.run.cmd, name('Run Command'))
            vim.keymap.set('n', '-', api.tree.change_root_to_parent, name('Up'))
            vim.keymap.set('n', 'a', api.fs.create, name('Create'))
            vim.keymap.set('n', 'bmv', api.marks.bulk.move, name('Move Bookmarked'))
            vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, name('Toggle No Buffer'))
            vim.keymap.set('n', 'c', api.fs.copy.node, name('Copy'))
            vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, name('Toggle Git Clean'))
            vim.keymap.set('n', '[c', api.node.navigate.git.prev, name('Prev Git'))
            vim.keymap.set('n', ']c', api.node.navigate.git.next, name('Next Git'))
            vim.keymap.set('n', 'd', api.fs.remove, name('Delete'))
            vim.keymap.set('n', 'D', api.fs.trash, name('Trash'))
            vim.keymap.set('n', 'E', api.tree.expand_all, name('Expand All'))
            vim.keymap.set('n', 'e', api.fs.rename_basename, name('Rename: Basename'))
            vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, name('Next Diagnostic'))
            vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, name('Prev Diagnostic'))
            vim.keymap.set('n', 'F', api.live_filter.clear, name('Clean Filter'))
            vim.keymap.set('n', 'f', api.live_filter.start, name('Filter'))
            vim.keymap.set('n', 'g?', api.tree.toggle_help, name('Help'))
            vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, name('Copy Absolute Path'))
            vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, name('Toggle Dotfiles'))
            vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, name('Toggle Git Ignore'))
            vim.keymap.set('n', 'J', api.node.navigate.sibling.last, name('Last Sibling'))
            vim.keymap.set('n', 'K', api.node.navigate.sibling.first, name('First Sibling'))
            vim.keymap.set('n', 'm', api.marks.toggle, name('Toggle Bookmark'))
            vim.keymap.set('n', 'p', api.fs.paste, name('Paste'))
            vim.keymap.set('n', 'P', api.node.navigate.parent, name('Parent Directory'))
            vim.keymap.set('n', 'q', api.tree.close, name('Close'))
            vim.keymap.set('n', 'r', api.fs.rename, name('Rename'))
            vim.keymap.set('n', 'R', api.tree.reload, name('Refresh'))
            vim.keymap.set('n', 's', api.node.run.system, name('Run System'))
            vim.keymap.set('n', 'S', api.tree.search_node, name('Search'))
            vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, name('Toggle Hidden'))
            vim.keymap.set('n', 'W', api.tree.collapse_all, name('Collapse'))
            vim.keymap.set('n', 'x', api.fs.cut, name('Cut'))
            vim.keymap.set('n', 'y', api.fs.copy.filename, name('Copy Name'))
            vim.keymap.set('n', 'Y', api.fs.copy.relative_path, name('Copy Relative Path'))
            -- END_DEFAULT_ON_ATTACH


            -- Mappings migrated from view.mappings.list
            --
            -- You will need to insert "your code goes here" for any mappings with a custom action_cb
            vim.keymap.set('n', 'o', api.tree.change_root_to_parent, name('Up'))
            vim.keymap.set('n', 'i', function()
                api.tree.change_root_to_node(api.tree.get_node_under_cursor())
            end, name('Focus current node'))
        end

        require("nvim-tree").setup({
            on_attach = on_attach
        })
        vim.keymap.set("n", "<Leader>pv", api.tree.toggle, { desc = "Toggle [P]roject [V]iew" })

        vim.g.nvim_tree_respect_buf_cwd = 1
    end
}
