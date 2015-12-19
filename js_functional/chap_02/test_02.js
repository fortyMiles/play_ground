var function_1 = function(arg1, callback){
    console.log(arg1);
    callback(arg1);
};


var function_2 = function(arg1){
    console.log(arg1);
};

function_1('test', function_2);

/*
 * function(arg1){
 *  return function_2(arg1) == function_2(arg1);
 * }
 * 
 * function_2(arg1)
 *
 *
 */

var immutableState = Object.freeze({
    mininum: 21
});

console.log(immutableState.mininum);
