import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/confetti.css'
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

const dataBookings = document.querySelector(".banner.show-banner");


if (dataBookings) {

flatpickr("#start_date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end_date"})],
  minDate: "today",
  maxDate: new Date().fp_incr(60),
  disable: JSON.parse(dataBookings.dataset.dates)
});
} else {

flatpickr("#start_date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end_date"})],
  minDate: "today",
  maxDate: new Date().fp_incr(60)
});

};
