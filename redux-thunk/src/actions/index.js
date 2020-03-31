
export const fetchPaintingsSuccessAction = (paintings) => {
  return {
      type: 'FETCH_PAINTINGS_SUCCESS',
      paintings: paintings
  }
}

export const deletePaintings = (id) => {
  return {
    type: 'DELETE_PAINTING',
    id
  }
}

export const deletePaintingThunk = (id) => {
  return function(dispatch) {
    fetch(`http://localhost:3000/paintings/${id}`, {method: 'DELETE'})
    .then(resp => resp.json())
    .then(data => {
      dispatch(deletePaintings(id))
    })
  };
}



export const fetchPaintingsThunk = () => {
  return function(dispatch) {
    fetch('http://localhost:3000/paintings')
    .then(resp => resp.json())
    .then(paintings => {
      dispatch(fetchPaintingsSuccessAction(paintings))
    })
  };
}








