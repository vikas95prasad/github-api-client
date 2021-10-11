import React, { useState, useEffect } from "react";

import { Button, PageLoader } from "neetoui";
import { Header, SubHeader } from "neetoui/layouts";

import searchApi from "apis/search";

const Search = () => {
  const [loading, setLoading] = useState(true);
  const [notes, setNotes] = useState([]);

  useEffect(() => {
    fetchNotes();
  }, []);

  const fetchNotes = async () => {
    try {
      setLoading(true);
      const response = await searchApi.fetch();
      setNotes(response.data.notes);
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <PageLoader />;
  }

  return (
    <>
      <Header title="Repository Search" />
    </>
  );
};

export default Search;
