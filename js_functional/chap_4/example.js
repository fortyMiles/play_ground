var compose = function(f, g){
    return function(x){
        return f(g(x));
    };
};

var to_upper_case = function(x){return x.toUpperCase();};
var exclaim = function(x){return x + '!';};

var shout = compose(exclaim, to_upper_case);

var reverse = reduce(function(acc,x){ return [x].contact(acc);}, []);
debugger;
shout('let us go');

reverse('here');
