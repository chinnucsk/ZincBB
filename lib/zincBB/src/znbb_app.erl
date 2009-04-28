-module(znbb_app).

-author("Tom McNulty <tom.mcnulty@cetiforge.com>").

%%%
%  ZincBB Application.
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

-behaviour(application).

-export([start/2, stop/1]).

-include("settings.hrl").

% ==========================================================
% Application API
% ==========================================================

start(_Type, _Args) -> (?DB_ENGINE):init(), nitrogen:start(znbb).

stop(_State) -> nitrogen:stop().
