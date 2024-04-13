import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bicycle-parkings"
export default class extends Controller {
  static targets = [
    "name",
    "error_name",
    "location",
    "error_location",
    "opening_hours",
    "error_opening_hours",
    "bicycle_capacity",
    "error_bicycle_capacity",
    "motorized_bicycle_under_50cc_capacity",
    "error_motorized_bicycle_under_50cc_capacity",
    "motorized_bicycle_under_125cc_capacity",
    "error_motorized_bicycle_under_125cc_capacity",
    "bicycle_and_motorized_bicycle_under_50cc_capacity",
    "error_bicycle_and_motorized_bicycle_under_50cc_capacity",
    "motorcycle_capacity",
    "error_motorcycle_capacity",
    "latitude",
    "error_latitude",
    "longitude",
    "error_longitude",
    "submit"
  ]

  nameValidation() {
    const name = document.getElementById("name").innerHTML
    const input = this.nameTarget
    const error = this.error_nameTarget
    this.required(name, input, error)
  }

  locationValidation() {
    const name = document.getElementById("location").innerHTML
    const input = this.locationTarget
    const error = this.error_locationTarget
    this.required(name, input, error)
  }

  openingHoursValidation() {
    const name = document.getElementById("opening_hours").innerHTML
    const input = this.opening_hoursTarget
    const error = this.error_opening_hoursTarget
    this.required(name, input, error)
  }

  bicycleCapacityValidation() {
    const name = document.getElementById("bicycle_capacity").innerHTML
    const input = this.bicycle_capacityTarget
    const error = this.error_bicycle_capacityTarget
    this.requiredAndgreaterThanZero(name, input, error)
  }

  motorizedBicycleUnder50ccCapacityValidation() {
    const name = document.getElementById("motorized_bicycle_under_50cc_capacity").innerHTML
    const input = this.motorized_bicycle_under_50cc_capacityTarget
    const error = this.error_motorized_bicycle_under_50cc_capacityTarget
    this.requiredAndgreaterThanZero(name, input, error)
  }

  motorizedBicycleUnder125ccCapacityValidation() {
    const name = document.getElementById("motorized_bicycle_under_125cc_capacity").innerHTML
    const input = this.motorized_bicycle_under_125cc_capacityTarget
    const error = this.error_motorized_bicycle_under_125cc_capacityTarget
    this.requiredAndgreaterThanZero(name, input, error)
  }

  bicycleAndMotorizedBicycleUnder50ccCapacityValidation() {
    const name = document.getElementById("bicycle_and_motorized_bicycle_under_50cc_capacity").innerHTML
    const input = this.bicycle_and_motorized_bicycle_under_50cc_capacityTarget
    const error = this.error_bicycle_and_motorized_bicycle_under_50cc_capacityTarget
    this.requiredAndgreaterThanZero(name, input, error)
  }

  motorcycleCapacityValidation() {
    const name = document.getElementById("motorcycle_capacity").innerHTML
    const input = this.motorcycle_capacityTarget
    const error = this.error_motorcycle_capacityTarget
    this.requiredAndgreaterThanZero(name, input, error)
  }

  latitudeValidation() {
    const name = document.getElementById("latitude").innerHTML
    const input = this.latitudeTarget
    const error = this.error_latitudeTarget
    this.required(name, input, error)
  }

  longitudeValidation() {
    const name = document.getElementById("longitude").innerHTML
    const input = this.longitudeTarget
    const error = this.error_longitudeTarget
    this.required(name, input, error)
  }

  validSubmit() {
    const submitBtn = this.submitTarget

    if (
      this.nameTarget.value !== "" && this.error_nameTarget.textContent === "" &&
      this.locationTarget.value !== "" && this.error_locationTarget.textContent == "" &&
      this.opening_hoursTarget.value !== "" && this.error_opening_hoursTarget.textContent == "" &&
      this.bicycle_capacityTarget.value !== "" && this.error_bicycle_capacityTarget.textContent == "" &&
      this.motorized_bicycle_under_50cc_capacityTarget.value !== "" && this.error_motorized_bicycle_under_50cc_capacityTarget.textContent == "" &&
      this.motorized_bicycle_under_125cc_capacityTarget.value !== "" && this.error_motorized_bicycle_under_125cc_capacityTarget.textContent == "" &&
      this.bicycle_and_motorized_bicycle_under_50cc_capacityTarget.value !== "" && this.error_bicycle_and_motorized_bicycle_under_50cc_capacityTarget.textContent == "" &&
      this.motorcycle_capacityTarget.value !== "" && this.error_motorcycle_capacityTarget.textContent == "" &&
      this.latitudeTarget.value !== "" && this.error_latitudeTarget.textContent == "" &&
      this.longitudeTarget.value !== "" && this.error_longitudeTarget.textContent == ""
    ) {
      submitBtn.disabled = false
      submitBtn.className = "bg-blue-500 hover:bg-blue-700 text-white text-sm font-bold py-2 px-4 rounded"
    } else {
      submitBtn.disabled = true
      submitBtn.className = "bg-gray-400 text-white text-sm font-bold py-2 px-4 rounded"
    }
  }

  required(name, input, error) {
    if (input.value === "") {
      input.classList.add("border-red-500")
      error.classList.add("text-red-500")
      error.textContent = `${name}を入力してください`
    } else {
      error.textContent = ""
      input.classList.remove("border-red-500")
    }
  }

  requiredAndgreaterThanZero(name, input, error) {
    if (input.value === "") {
      input.classList.add("border-red-500")
      error.classList.add("text-red-500")
      error.textContent = `${name}を入力してください`
    } else if (input.value < 0) {
      input.classList.add("border-red-500")
      error.classList.add("text-red-500")
      error.textContent = `${name}は0以上で入力してください`
    } else {
      error.textContent = ""
      input.classList.remove("border-red-500")
    }
  }
}
