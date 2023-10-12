import os

from flask import Flask


def create_app(test_config=None):
    # create and configure the app
    # instance_relative_config=True tells flask that our config files
    # lie outside of the `flaskr` folder (which is a python module now)
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_mapping(
        SECRET_KEY='dev', # This should be set to a long random value in prod
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass


    # Set up the databse
    from . import db
    db.init_app(app)

    # Add the auth stuff
    from . import auth
    app.register_blueprint(auth.bp)

    # Register the blog
    from . import blog
    app.register_blueprint(blog.bp)
    app.add_url_rule('/', endpoint='index')

    # a simple page that says hello
    @app.route('/up')
    def hello():
        return 'Hello, World!'

    return app
