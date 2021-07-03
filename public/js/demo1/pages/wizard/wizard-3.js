"use strict";

// Class definition
var KTWizard3 = function () {
	// Base elements
	var wizardEl;
	var formEl;
	var validator;
	var wizard;

	// Private functions
	var initWizard = function () {
		// Initialize form wizard
		wizard = new KTWizard('kt_wizard_v3', {
			startStep: 1,
		});

		// Validation before going to next page
		wizard.on('beforeNext', function(wizardObj) {
				})

		// Change event
		wizard.on('change', function(wizard) {
			KTUtil.scrollTop();
		});
	}



	return {
		// public functions
		init: function() {
			wizardEl = KTUtil.get('kt_wizard_v3');
			formEl = $('#kt_form');

			initWizard();
		}
	};
}();

jQuery(document).ready(function() {
    KTWizard3.init();


});
