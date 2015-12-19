var hi = function(name){
    return "hi " + name;
};

var greeting = function(name){
    return hi(name);
};


console.log(hi);
console.log(hi(''));
