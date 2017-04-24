-module(simple_books_controller, [Req]).
-compile(export_all).

list('GET', []) ->
    LibraryBooks = boss_db:find(books, []),
    {ok, [{books, LibraryBooks}]}.

create('GET', []) ->
    {ok, []};
create('POST', []) ->
    Book = books:new(id, Req:post_param("Title"), Req:post_param("AuthorName")),
    case Book:save() of
        {ok, SavedBook} -> 
            {redirect, "/books/list/"};
        {error, Errors} ->
           {ok, [{errors, Errors}, {books, Book}]}
    end.