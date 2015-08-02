The steps for using Polymer components in an Elm app are:

* Initialize project to use bower

      bower init

* Install Polymer dependencies via bower

      bower install --save Polymer/polymer#^0.5

* Install the Polymer component(s) of interest, like so

      bower install --save Polymer/paper-checkbox#^0.5

* Include Polymer JavaScript and HTML files, as well as the
  HTML file for the component(s) you're using, in your main HTML file

	  <script src="../bower_components/webcomponentsjs/webcomponents.min.js"></script>
	  <link rel="import" href="../bower_components/polymer/polymer.html">
	  <link rel="import" href="../bower_components/paper-checkbox/paper-checkbox.html">

* Install the elm-html package

      elm-package install evancz/elm-html

* Actually use a Polymer component in your Elm file;
  since they're HTML5 custom tags, use elm-html's node function

      .
      .
      .
      node "paper-checkbox" [ checked False ] []
      .
      .
      .

* In your main HTML file, include the following JavaScript to load
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
