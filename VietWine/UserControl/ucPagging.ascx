<%@ Control Language="C#" AutoEventWireup="true" Inherits="CodeUtility.PaggingUtility"  %>

 <div class="pagination">
        <ul>
            <li>
                <a runat="server" id="PageFirst" href="#" class="invarseColor" title="first">&laquo</a>
            </li>
            <asp:Repeater ID="PageRepeater" runat="server">
                <ItemTemplate>
                    <li>
                        <a runat="server" id="PageNumber" data-active="invarseColor page-active" class="invarseColor" href="#">1</a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <li>
                <a runat="server"  id="PageLast" href="#" class="invarseColor" title="last">&raquo;</a>
            </li>
        </ul>
    </div>


