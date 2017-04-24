-module(simple_about_controller, [Req]).
-compile(export_all).

index('GET',[]) ->
	Welcome = "Welcome, bud!",
	About = "About Page",
{
	ok, 
	[
		{hello, Welcome},
		{the_title, About}
	]
}.