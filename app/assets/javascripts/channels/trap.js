//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.trap = App.cable.subscriptions.create('TrapChannel', {
    received: function (data) {
        console.log(data.query_params);
        const newRequest = renderNewRequest(data);
        document.querySelector('.request-table>tbody').append(newRequest);
    }
});

function renderNewRequest(data) {
    let queryParamsHtml = '';
    let cookiesHtml = '';
    let headersHtml = '';
    if (data.query_params) {
        const parsedQueryParams = JSON.parse(data.query_params);
        Object.keys(parsedQueryParams).forEach(key => queryParamsHtml += `<p>${key}: ${parsedQueryParams[key]}</p>`)
    }
    if (data.cookies) {
        const parsedCookies = JSON.parse(data.cookies);
        Object.keys(parsedCookies).forEach(key => cookiesHtml += `<p>${key}: ${parsedCookies[key]}</p>`)
    }
    if (data.headers) {
        const parsedHeaders = JSON.parse(data.headers);
        Object.keys(parsedHeaders).forEach(key => headersHtml += `<p><strong>${key}</strong>: ${parsedHeaders[key]}</p>`);
    }
    const tr = document.createElement('tr');
    tr.innerHTML = `<td>
                        ${data.created_at}
                   </td>
                   <td>
                        ${data.remote_ip}
                   </td>
                   <td>
                        ${data.request_method}
                   </td>
                   <td>
                        ${data.scheme}
                   </td>
                   <td>
                        ${data.query_string}
                   </td>
                   <td>
                        ${queryParamsHtml}
                   </td>
                   <td>
                        ${cookiesHtml}
                   </td>
                   <td>
                        ${headersHtml}
                   </td>`;
    return tr;
}