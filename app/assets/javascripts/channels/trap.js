//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.trap = App.cable.subscriptions.create('TrapChannel', {
    received: function (data) {
        const newRequest = renderNewRequest(data);
        document.querySelector('.request-table>tbody').append(newRequest);
    }
});

function renderNewRequest(data) {
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
                        <a href="/requests/${data.id}">Show</a>
                   </td>`;
    return tr;
}