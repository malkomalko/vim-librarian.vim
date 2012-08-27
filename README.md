# INSTALLATION

There are several ways to install the plugin. The recommended one is by using
Tim Pope's pathogen (http://www.vim.org/scripts/script.php?script_id=2332). In
that case, you can clone the plugin's git repository like so:

    git clone git://github.com/malkomalko/vim-librarian.vim.git ~/.vim/bundle/librarian

If your vim configuration is under git version control, you could also set up
the repository as a submodule, which would allow you to update more easily.
The command is (provided you're in ~/.vim):

    git submodule add git://github.com/malkomalko/vim-librarian.vim.git bundle/librarian

Another way is to simply copy all the essential directories inside the ~/.vim
directory: plugin, autoload, doc.

Thanks to AndrewRadev's https://github.com/AndrewRadev/simple_bookmarks.vim
which this is a fork of.

# USAGE

This plugin differs from Andrew's simple_bookmarks in that you may bookmark
multiple locations with the same bookmark name, allowing for you to restore
sets of bookmarks.

* * *

###:VLBookmark *bookmark*

command accepts a name to store the bookmark. It will save the
current file and the cursor position to ~/.vim_librarian (by default).

* * *

###:VLOpenBookmarks *bookmark*

will save and close all open buffers and then open up every file for <bookmark>
giving you a clean slate to edit the part of the application you like.

* * *

###:VLQFOpenBookmarksFor *bookmark*

will open a quickfix window with the bookmarks allowing you
jump to a bookmark manually.

* * *

###:VLQFOpenBookmarks

will open up all your bookmarks in a quickfix window.

* * *

###:VLDelBookmark *bookmark*

highlight the current bookmarked line and type in this tab to remove it from
the library.

* * *

Note: all commands accepting a <bookmark> name can be tab completed.

Note that bookmarks should be synchronized between vim instances. Anytime you
add a mark in one vim instance, it should be available in all others. In
practice, this is achieved by simply reading and writing the whole file on
each update. I have yet to experiment to find out if there are any performance
issues or race conditions.
