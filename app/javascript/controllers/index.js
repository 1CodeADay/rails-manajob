// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Explanation : it Import and register all the controllers from the app/javascript/controllers,
// just create the controller with the appropriate name and stimulus will load it for you,
// no need to register it in this file like the profile menu :
// import ProfileMenuController from "./profile_menu_controller";
// application.register("profile-menu", ProfileMenuController);

eagerLoadControllersFrom("controllers", application)
