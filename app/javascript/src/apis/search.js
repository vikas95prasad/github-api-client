import axios from "axios";

const fetchAll = payload =>
  axios.get("api/v1/search/repositories", { params: payload });

const searchApi = {
  fetchAll
};

export default searchApi;
