# iMPORTS #
# ------- #
import os
from dotenv import load_dotenv
from pathlib import Path

dotenv_path = Path('.env')
load_dotenv(dotenv_path=dotenv_path)

# base config
class Config():

    SECRET_KEY = os.environ.get("SECRET_KEY")

    @staticmethod
    def init_app(app):
        pass

# development config
class DevelopmentConfig(Config):

    DEBUG = True

# testing config
class TestingConfig(Config):

    TESTING = True

# production config
class ProductionConfig(Config):

    pass


# environment config
env_config = {
    "dev": DevelopmentConfig,
    "testing": TestingConfig,
    "production": ProductionConfig
    }
