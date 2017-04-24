-module(simple_voter_controller, [Req]).
-compile(export_all).

list('GET', [], WardBoss) ->
    Voters = boss_db:find(voter, []),
    {ok, [{voters, Voters}]}.

view('GET', [VoterId], WardBoss) ->
    Voter = boss_db:find(VoterId),
    {ok, [{voter, Voter}, {ward_boss, WardBoss}]}.

 before_(_) ->
    user_lib:require_login(Req).

register('GET', [], WardBoss) ->
    {ok, []};
register('POST', [], WardBoss) ->
    Voter = voter:new(id, Req:post_param("first_name"), Req:post_param("last_name"),
        Req:post_param("address"), Req:post_param("notes"), WardBoss:id()),
    case Voter:save() of
        {ok, SavedVoter} -> 
            {redirect, "/voter/view/"++SavedVoter:id()};
        {error, Errors} ->
           {ok, [{errors, Errors}, {voter, Voter}]}
    end.