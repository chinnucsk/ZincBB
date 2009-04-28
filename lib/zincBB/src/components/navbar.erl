-module(navbar).

-author("Tom McNulty <tom.mcnulty@cetiforge.com>").

%%%
% Navigation Bar
%
%%%
%   Copyright 2009 Ceti Forge
%
%   Licensed under the Apache License, Version 2.0 (the "License");
%   you may not use this file except in compliance with the License.
%   You may obtain a copy of the License at
%
%       http://www.apache.org/licenses/LICENSE-2.0
%
%   Unless required by applicable law or agreed to in writing, software
%   distributed under the License is distributed on an "AS IS" BASIS,
%   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%   See the License for the specific language governing permissions and
%   limitations under the License.
%

-include("./lib/nitrogen/include/wf.inc").

-export([display/0]).

display() ->
    case wf:role(member) of
      false -> guest();
      true -> member()
    end.

guest() ->
    % Data = [{Title, Path, Module}]
    Data = [{"Main", "/", "index"}, {"Signup", "/znbb/signup", "signup"}],
    Map = [item@text, item@url],
    #list{body =
	      #bind{data = Data, map = Map, transform = mark_current(),
		    body = #listitem{body = #link{id = item}}}}.

member() ->
    Data = [{"Main", "/", "index"}, {"Profile", "/znbb/profile", "profile"}],
    Map = [item@text, item@url],
    #list{body =
	      #bind{data = Data, map = Map, transform = mark_current(),
		    body = #listitem{body = #link{id = item}}}}.

mark_current() ->
    CurS = atom_to_list(wf:get_page_module()),
    ["znbb", "page", Current | _Rest] = string:tokens(CurS, "_"),
    fun ({Text, Link, Name}, Acc) when Name =:= Current ->
	    {[Text, Link], Acc, {item@class, "current"}};
	({Text, Link, _Other}, Acc) -> {[Text, Link], Acc, []}
    end.
