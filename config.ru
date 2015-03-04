require './config/environment'

use Rack::MethodOverride
use RestaurantsController
run ApplicationController