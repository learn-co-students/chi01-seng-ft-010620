import React from "react"

const PizzaForm = (props) => {
  return(
      <div className="form-row">
        <div className="col-5">
            <input onChange={props.handleChange} name='topping' type="text" className="form-control" placeholder="Pizza Topping" value={ props.editPizza.topping }/>
        </div>
        <div className="col">
          <select onChange={props.handleChange} value={props.editPizza.size} className="form-control" name='size'>
            <option value="Small">Small</option>
            <option value="Medium">Medium</option>
            <option value="Large">Large</option>
          </select>
        </div>
        <div className="col">
          <div className="form-check">
            <input onChange={props.handleChange} className="form-check-input" name='vegetarian' type="radio" value="Vegetarian" checked={props.editPizza.vegetarian}/>
            <label className="form-check-label">
              Vegetarian
            </label>
          </div>
          <div className="form-check">
            <input onChange={props.handleChange} className="form-check-input" name='vegetarian' type="radio" value="Not Vegetarian" checked={!props.editPizza.vegetarian}/>
            <label className="form-check-label">
              Not Vegetarian
            </label>
          </div>
        </div>
        <div className="col">
          <button onClick={props.saveEdit} type="submit" className="btn btn-success">Submit</button>
        </div>
      </div>

  )
}

export default PizzaForm

PizzaForm.defaultProps = {
  editPizza: {
    topping: 'foo',
    size: 'Small',
    vegetarian: true
  }
}










