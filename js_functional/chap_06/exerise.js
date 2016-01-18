var _ = require('ramda');
var accounting = require('accounting');

// Example Data
var CARS = [
    {name: "Ferrari FF", horsepower: 660, dmollar_value: 700000, in_stock: true},
    {name: "Spyker C12 Zagato", horsepower: 650, dollar_value: 648000, in_stock: false},
    {name: "Jaguar XKR-S", horsepower: 550, dollar_value: 132000, in_stock: false},
    {name: "Audi R8", horsepower: 525, dollar_value: 114200, in_stock: false},
    {name: "Aston Martin One-77", horsepower: 750, dollar_value: 1850000, in_stock: true},
    {name: "Pagani Huayra", horsepower: 700, dollar_value: 1300000, in_stock: true}
  ];

// Exercise 1:
// ============
// use _.compose() to rewrite the function below. Hint: _.prop() is curried.
/*
var isLastInStock = function(cars) {
  var last_car = _.last(cars);
  return _.prop('in_stock', last_car);
};
*/


var isLastInStock = _.compose(_.prop('in_stock'), _.last);
console.log( isLastInStock(CARS) );

var nameOfFirstCar =  _.compose(_.prop('name'), _.head);

console.log( nameOfFirstCar(CARS));

var _average = function(xs) {return _.reduce(_.add, 0, xs) / xs.length; };





averageDollarValue = _.compose(
	_average, 
	_.map(
		_.prop('dollar_value')
	)
);

sanitizeNames = _.map(
	_.compose(
		_.replace('/\W+/g', '_'), 
		_.toLower,
		_.prop('name')
	)
);

availablePrices = _.compose(
	_.join(','),
	_.map(
		_.compose(
			accounting.formatMoney, 
			_.prop('dollar_value')
		)
	), 
	_.filter(
		_.prop('in_stock')
	)
);

console.log(availablePrices(CARS));

var sort_by_horsepower = _.sortBy(_.prop('horsepower'));
var append = _.flip(_.concat);
var fastest_car = _.compose(
	append('is the fastest'), 
	_.prop('name'), 
	_.last, 
	sort_by_horsepower
);

console.log(fastest_car(CARS));
