# iMPORTS #
# ------- #
from flask import Blueprint, jsonify

main = Blueprint('main', __name__)

# HOME PAGE
@main.route('/')
def index():

    return jsonify({"message":"Welcome to my simple APi"})
