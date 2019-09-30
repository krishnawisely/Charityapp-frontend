$(function(){
            console.log('This is jquery!');
            let url = "http://localhost:8080/Charityapp-api/ListDonorServlet";
            $.getJSON(url,(res)=>{
                console.log(res);
                //let resData = JSON.parse(res);
                let resData = res;
                let donorList = "";
                for(let donor of resData)
                {
                    donorList += "<tr><td>"+donor.name+"</td>";
                    donorList += "<td>"+donor.email+"</td>";
                    donorList += "<td>"+donor.dateOfBirth.day+"-"+donor.dateOfBirth.month+"-"+donor.dateOfBirth.year+"</td>";
                    donorList += "<td>"+donor.gender+"</td>";
                    donorList += "</tr>";
                }
                $('#donorList').html(donorList);
                // console.log(res.name);
            });
        });