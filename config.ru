require './config/environment'

use Rack::MethodOverride
use RestaurantsController
use ViolationsController
run ApplicationController