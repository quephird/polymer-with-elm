## Setting up a new Elm project to use Polymer 

The steps for using Polymer components in an Elm app are:

* ##### Initialize project to use bower

        bower init

* ##### Install Polymer dependencies via bower

        bower install --save Polymer/polymer

* ##### Install the Polymer component(s) of interest, like so

        bower install --save Polymer/paper-checkbox

* ##### Include Polymer JavaScript and HTML files, as well as the
  HTML file for the component(s) you're using, in your main HTML file

		<script src="../bower_components/webcomponentsjs/webcomponents.min.js"></script>
		<link rel="import" href="../bower_components/polymer/polymer.html">
		<link rel="import" href="../bower_components/paper-checkbox/paper-checkbox.html">

* ##### Install the elm-html package

	    elm-package install evancz/elm-html

* ##### Actually use a Polymer component in your Elm file;
  since they're HTML5 custom tags, use elm-html's node function

      .
      .
      .
      node "paper-checkbox" [ checked False ] []
      .
      .
      .

* ##### In your main HTML file, include the following JavaScript to load
  your transpiled Elm file.

      .
      .
      .
      <script src="Polymer.js"></script>
      <script>
        Elm.fullscreen(Elm.Polymer);
      </script>
      .
      .
      .

## How to just get this example running

If you just want to run the example HTML file, do the following:

* ##### Clone this repo

        git clone https://github.com/quephird/polymer-with-elm
      
  ... and move into the new directory.

* ##### Run Bower to get dependencies

  You need to have Bower first, which in turn requires node.js and NPM. See the directions on obtaining both [here](https://nodejs.org/download/) and [here](http://bower.io/#install-bower)
  
  Once you have them, run this from within the project directory:
  
      bower install

* ##### Compile the Elm code

  Run the following:

      elm-make ChartDemo.elm --output ChartDemo.js

  The first time you ever run this, you'll get something like the following:

      Some new packages are needed. Here is the upgrade plan.
	
	  Install:
	    elm-lang/core 2.1.0
	    evancz/elm-html 4.0.1
	    evancz/virtual-dom 2.0.0
	
      Do you approve of this plan? (y/n)

  Type 'y', wait for those packages to be downloaded and for the code to be successfully compiled.

* ##### Run an HTTP server

  Because the Polymer dependencies require local HTML includes, you will need to run an actual HTTP server versus simply opening the file directly in a browser. (You can see the details of this [here](https://github.com/Polymer/polymer/issues/1535) if you like.)
  
  If you don't already have a Web server at all or want to avoid having to go through a lot of ceremony spinning and setting up one, you can use this one-liner:
  
      python -m SimpleHTTPServer
      
  This of course means you need Python to begin with; you can go [here](https://www.python.org/downloads/) for details on how to install that.

* ##### Point your browser to the demo HTML page

  Now you're finally ready to run the example; simply point your browser [htto://localhost:8000/ChartDemo.html](htto://localhost:8000/ChartDemo.html) and you should see a nice pie chart!