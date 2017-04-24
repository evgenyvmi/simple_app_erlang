-module(simple_index_controller, [Req]).
-compile(export_all).

list('GET', []) ->
    LibraryBooks = boss_db:find(library_book, []),
    {ok, [{books, LibraryBooks}]}.