// Apply dark mode by default
document.body.classList.add('dark');

// Set the switchMode checkbox to checked by default
const switchMode = document.getElementById('switch-mode');
if (switchMode) {
	switchMode.checked = true;

	// Add event listener for toggling dark mode
	switchMode.addEventListener('change', function () {
		if (this.checked) {
			document.body.classList.add('dark');
		} else {
			document.body.classList.remove('dark');
		}
	});
}

// Sidebar menu active state logic
const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');
allSideMenu.forEach(item => {
	const li = item.parentElement;

	item.addEventListener('click', function (e) {
		allSideMenu.forEach(i => {
			i.parentElement.classList.remove('active');
		});
		li.classList.add('active');

		// Navigate to addNewProduct.jsp if "Add Product" is clicked
		if (item.innerText.trim() === "Add Product") {
			e.preventDefault(); // Prevent default behavior if needed
			window.location.href = "addNewProduct.jsp"; // Navigate to the JSP page
		}
	});
});

// TOGGLE SIDEBAR
const menuBar = document.querySelector('#content nav .bx.bx-menu');
const sidebar = document.getElementById('sidebar');

menuBar.addEventListener('click', function () {
	sidebar.classList.toggle('hide');
});

// Search functionality for smaller screens
const searchButton = document.querySelector('#content nav form .form-input button');
const searchButtonIcon = document.querySelector('#content nav form .form-input button .bx');
const searchForm = document.querySelector('#content nav form');

searchButton.addEventListener('click', function (e) {
	if (window.innerWidth < 576) {
		e.preventDefault();
		searchForm.classList.toggle('show');
		if (searchForm.classList.contains('show')) {
			searchButtonIcon.classList.replace('bx-search', 'bx-x');
		} else {
			searchButtonIcon.classList.replace('bx-x', 'bx-search');
		}
	}
});

// Adjustments based on window size
if (window.innerWidth < 768) {
	sidebar.classList.add('hide');
} else if (window.innerWidth > 576) {
	searchButtonIcon.classList.replace('bx-x', 'bx-search');
	searchForm.classList.remove('show');
}

window.addEventListener('resize', function () {
	if (this.innerWidth > 576) {
		searchButtonIcon.classList.replace('bx-x', 'bx-search');
		searchForm.classList.remove('show');
	}
});
