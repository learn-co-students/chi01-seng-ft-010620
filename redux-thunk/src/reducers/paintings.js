const initialState = [
]


export default function paintings(state = initialState, action) {
  console.log('state', state)
  console.log('action', action)

  switch (action.type) {
    case 'FETCH_PAINTINGS_SUCCESS': 
      return [...action.paintings]
    case 'UPDATE_VOTE': 
      return state.map( art => {
        if (art.id === action.id) {
          return {
            ...art,
            votes: art.votes + 1
          }
        } else {
          return art
        }
      })
    case 'DELETE_PAINTING': 
      return state.filter(art => art.id !== action.id)
    default:
      return state
  }
}






