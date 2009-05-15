-module(znbb_sup).

-author("Tom McNulty <tom.mcnulty@cetiforge.com>").

%%%
%  Supervisor
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
%%%
-behaviour(supervisor).

-export([init/1, start_link/0]).


start_link() ->
    supervisor:start_link(?MODULE, []).


init(_Args) ->
    {ok, {{one_for_one, 3,  60}, [
		{znbb_distid,
		    {znbb_distid, start_link, []},
		    permanent,
		    5,
		    worker,
		    [znbb_distid] }
	    ]}
    }.

