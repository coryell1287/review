const axios = require("axios");

function getAttendees(obj) {
  const map = new Map();
  return obj.partners.reduce((acc, cur) => {
    map.set(cur.country, (map.get(cur.country) || 0) + 1);

    const x = acc.findIndex(function (item) {
      return item.name === cur.country;
    });

    if (x < 0) {
      return [
        ...acc,
        {
          attendeeCount: map.get(cur.country),
          attendees: [].concat(cur.email),
          name: cur.country,
          startDate: [].concat(cur.availableDates)[0],
        },
      ];
    }

    acc[x].startDate =
      +new Date(acc[x].startDate) > +new Date(cur.availableDates[0])
        ? cur.availableDates[0]
        : acc[x].startDate;
    acc[x].attendees.push(cur.email);
    acc[x].attendeeCount = map.get(cur.country);
    return acc;
  }, []);
}

const transformAttendees = axios
  .get(
    "https://candidate.hubteam.com/candidateTest/v3/problem/dataset?userKey=72143e03c18268793ad332cab50b"
  )
  .then((res) => {
    return getAttendees(res.data);
  });

transformAttendees.then((result) => {
  axios({
    url: "https://candidate.hubteam.com/candidateTest/v3/problem/result?userKey=72143e03c18268793ad332cab50b",
    method: "post",
    data: {
      countries: [...result],
    },
  })
    .then((res) => {
      console.log(data);
    })
    .catch((error) => {
      console.log(error, "Error");
    });
});
