//-------------------------------
// Arrow Functions
//-------------------------------

//when can i remove brackets?
//when can i remove parens?

function sum(a, b)  {
  return a + b;
}

let sum2 = (a, b) => a + b


function isPositive(num) {
  return num > 0;
}

let isPositive2 = num => num > 0


function randomNum() {
  return Math.random();
}
let randomNum2 = () => Math.random();


// document.addEventListener('click', function(e){
  // console.log(e)
// })

// document.addEventListener('click', (e) => console.log(e))

// this example:


class Person {
  constructor(){
    this.age = 0;
    setInterval(() => {
      this.age++;
      console.log(this.age)
    }, 1000);
  }
}






//-------------------------------
// **Spread Operator**
//-------------------------------
//
//








// add elements of one array to another:
const foo = [1, 3, 5, 11]
const odds = [...foo, 7, 9]
const odds2= [foo, 7, 9]
// console.log(odds) // [1, 3, 5, 7, 9]
// console.log(odds2) // [[1, 3, 5], 7, 9]

// pass elements of an array into a f(x) as args

function addEm(x, y, z) {
  console.log(x + y + z)
}

// addEm(foo[0], foo[1], foo[2])

// addEm(...foo)
















//-------------------------------
// **Rest Operator**
//-------------------------------
// condenses multiple elements into an array




function lotsOfArgs(mainVar, ...theRest){
  console.log('this is mainVar', mainVar);
  console.log('this is rest', theRest);
}


lotsOfArgs(5, 2, '324', 4)

















//-------------------------------
// **Destructuring Operator**
//-------------------------------



// basic var assignment from obj
const eggs = {a: 1, b: 2}

const {a, b} = eggs

// nested var assignment from obj
const rob = {bar: { baz: 'hola'}, b: 2}

const { bar: { baz }} = rob;




// assign var assignment from arr 
const colors = ['red', 'white', 'yellow', 'green'];

const [primaryColor, secondaryColor, ...backups] = colors;


console.log(primaryColor)
console.log(secondaryColor)
console.log(backups)






function foo(props) {
  console.log(props) // { user: { id, name, email: friends}, x: 1, y: 2, ......}
  const { isDisabled, user: { id, friends }} = props

  props.isDisabled
}

