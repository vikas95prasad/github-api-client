import React, { useState } from "react";

import { PageLoader, Input } from "neetoui";

import searchApi from "apis/search";

const Search = () => {
  const [loading, setLoading] = useState(false);
  const [repositories, setRepositories] = useState([]);
  const [totalRepositories, setTotalRepositories] = useState(0);
  const [repositorySearchTerm, setRepositorySearchTerm] = useState([]);

  const updateSearchResults = async searchTerm => {
    try {
      setTotalRepositories(0);
      setRepositorySearchTerm(searchTerm);
      setLoading(true);
      setRepositories([]);
      debugger;
      if (searchTerm !== "") {
        const response = await searchApi.fetchAll({ q: searchTerm });
        setRepositories(response.data.repositories);
        setTotalRepositories(response.data.total_count);
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <div className="flex flex-col items-center justify-center mx-auto sm:max-w-md mt-9">
        <h2 className="text-3xl font-extrabold text-center text-gray-800">
          Search Public Repository
        </h2>
        <div className="w-full p-8 space-y-6 bg-white rounded-md">
          <Input
            type="text"
            placeholder="Enter repository name"
            value={repositorySearchTerm}
            onChange={e => updateSearchResults(e.target.value)}
          />
          {loading && (
            <div>
              <PageLoader />
            </div>
          )}
        </div>
      </div>
      <div className="ml-7">
        {totalRepositories > 0 && (
          <div className="mb-8">TOTAL : {totalRepositories}</div>
        )}
        {repositories.map(function (repo, idx) {
          return <li key={idx}>{repo.fullName}</li>;
        })}
      </div>
    </>
  );
};

export default Search;
