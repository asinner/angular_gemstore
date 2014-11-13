# README
### Description
This application is a small store that lists descriptions, specs, and reviews for different products (gems). You can add reviews under the review tab, and watch a live preview of it. This application utilizes Rails and Angular and is an application based off of the 'Shaping Up With Angular' course found on Code School.

[Production app can be found here](https://guarded-shelf-9201.herokuapp.com/)

### Authentication in Angular
With help from [this article](https://medium.com/opinionated-angularjs/techniques-for-authentication-in-angularjs-applications-7bbf0346acec) authentication in Angular is viable task.

##### The approach:
1. Use Angular's $http post to send an email and password to your designated Rails controller
2. Check to see if your user exists with the credentials
3. If the user authenticates: 
	- assign them a token in your database and pass it back to Angular
	- in Angular, store that token in a Session service as well as $cookieStore
	- in Angular, pass that token on every subsequent request that requires authentication
	- in Rails, for every request that needs authentication, check the token
	- in Rails, perform the action if the token exists, otherwise render a 403


### Implementation
------
The first step in translating the Code School course into a Rails application was getting Angular required.

#### CodeSchool approach
- Download angular.min.js
- Install in assets/javascripts
- Require in `<head>`
	
#### Rails Approach
- Installing/configuring bower 
	- `$ npm install -g bower`
  - create `.bowercc`
  - `application.rb`:
		- `config.assets.paths << Rails.root.join('vendor', 'assets', 'components')`
- installing Angular: 
	- `$ bower install angular`
- Require in application.js
	- `//= require angular`

-----
The next step involved getting bootstrap loaded in:

#### CodeSchool approach
- Download bootrap.css
- Install in assets/stylesheets
- Require in `<head>`
	
#### Rails Approach
- installing Angular: 
	- `$ bower install bootstrap`
- Require in application.css
	- `//= require bootstrap/dist/css/bootstrap`
	
----
After getting the dependencies installed, then the next step was to modify application.js:
```js
//= require jquery
//= require jquery_ujs
//= require angular
//= require gemstore
````
Then create a gemstore.js in `assets/javascripts` and copy over the previous gemstore. The top of gemstore.js now:
```js
//= require_self
//= require_tree ./gemstore_app
```
After this, createing a gemstore_app directory in app/javascripts/ and placing in all of the oustanding files into respective directories. Ie: store-directives gets placed into the directives directory, and the StoreContoller.js getting placed into a controllers directory.

The next step was to move all of the templates & images into the public folder, and reflect the change inside the store_controller.js.

The file step involved copying over the index.html `<body>` into the show.html.
	


