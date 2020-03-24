const initialState = [
]


export default function paintings(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_PAINTINGS_SUCCESS': 
      return [...action.paintings]
    default:
      return state
  }
}






