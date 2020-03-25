const fetchPaintingsSuccess = (paintings) => {
   return { 
      type: 'FETCH_PAINTINGS_SUCCESS',
      paintings: paintings
    }
}


export const thunkFetchPaintings = () => {
  return function(dispatch) {
    fetch('http://localhost:3000/art')
    .then(resp => resp.json())
    .then(paintings => {
      console.log('here')
      dispatch(fetchPaintingsSuccess(paintings))
    })
  };
}

