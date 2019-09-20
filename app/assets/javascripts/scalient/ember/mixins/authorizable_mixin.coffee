# -*- coding: utf-8 -*-
#
# Copyright 2015 Roy Liu
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

((factory) ->
  if typeof define is "function" and define.amd?
    define ["ember"], factory
).call(@, (Ember) ->
  AuthorizableMixin = Ember.Mixin.create
    authorize: (model, queryParams = {}) ->
      route = @

      Ember.RSVP.resolve(model).then(
        null,
        ((e) ->
          if e.errors[0].status is "401"
# This is some black magic that's necessary to fix `https://github.com/emberjs/ember.js/issues/12169`.
            route.router.router.activeTransition.abort()
            route.transitionTo(route.get("authorizeRedirect"), queryParams: queryParams)
        )
      )

      model

  AuthorizableMixin
)
