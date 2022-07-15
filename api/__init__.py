from datetime import timedelta
from flask import Flask
from .config import env_config

# APP CONFIG
app = Flask(__name__)

ACCESS_EXPIRES = timedelta(hours=24)

def create_app(config_name):

    # INIT APP CONFiG IN APP
    app.config.from_object(env_config[config_name])

    # REGISTER BLUEPRINTS

    from api.routes import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app
