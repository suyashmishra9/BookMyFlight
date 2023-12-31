import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree.