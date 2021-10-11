import axios from "axios";

const fetch = () => axios.get("api/v1/search");

const notesApi = {
  fetch
};

export default notesApi;
