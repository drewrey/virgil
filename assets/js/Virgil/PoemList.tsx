import React from "react";
import {gql} from "apollo-boost";
import {useQuery} from "react-apollo";

interface Poem {
  id: string;
  title: string;
  author: string;
  text: string;
}

interface PoemsQueryResult {
  poems: Poem[];
}

const PoemList = () => {
  const {data, loading, error} = useQuery<PoemsQueryResult>(gql`
    {
      poems {
        id
        title
        author
        text
      }
    }
  `)

  return <div>
    <h3>Poems</h3>
    <ul>
      {data?.poems ? data.poems.map(poem => (
        <li key={poem.id}>{poem.author} -- {poem.title}</li>
      )) : null
      }
    </ul>
  </div>
};

export default PoemList;