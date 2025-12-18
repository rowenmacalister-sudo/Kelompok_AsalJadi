program Mbanking;
uses crt, SysUtils;
type
    account = record
        username : string;
        PIN : string;
        balance : integer;
        history_c : integer;
    end;

    history = record
        deskripsi : string;
        nominal : longint;
        waktu : string;
    end;
var
    acc : array[1..3] of account;
    his : array[1..100] of history;
    t_acc : integer = 0;
procedure addhis(i:integer; des:string; nominal:longint);
var t:string;
begin
    t := DateTimeToStr(Now);
    inc(acc[i].history_c);
    his[acc[i].history_c].deskripsi := des;
    his[acc[i].history_c].nominal := nominal;
    his[acc[i].history_c].waktu := t;
end;
procedure showhis(i:integer);
var b : integer;
begin
    clrscr;
    writeln('=== RIWAYAT TRANSAKSI ', acc[i].username, ' ===');

    if acc[i].history_c = 0 then
    begin
        writeln('Belum ada transaksi.');
        readln;
        exit;
    end;

    for b:= 1 to acc[i].history_c do
    begin
        writeln(b, '. ', his[b].deskripsi, ' - Rp', his[b].nominal);
        writeln('   Waktu: ', his[b].waktu);
        readln;
    end;
end;

function sel : integer;
var
    i : integer;
    key : char;
begin
    if t_acc = 0 then begin sel := -1; exit; end;

    i := 1;
    while true do
    begin
        clrscr;
        writeln('=== PILIH AKUN ===');
        writeln('Gunakan A/D, ENTER untuk pilih');
        writeln('Akun: ', acc[i].username);

        key := readkey;
        case key of
            'a','A' : dec(i);
            'd','D' : inc(i);
            #13 : begin sel := i; exit; end;
        end;

        if i < 1 then i := t_acc
        else if i > t_acc then i := 1;
    end;
end;

procedure regis;
begin
    if t_acc = 3 then
    begin
        writeln('Maksimum 3 akun.');
        readln;
        exit;
    end;

    inc(t_acc);
    clrscr;
    with acc[t_acc]
    begin
    write('Masukkan username: '); readln(username);
    write('Masukkan PIN: '); readln(PIN);
    balance := 0;
    history_c := 0;
    end;
    writeln('Akun berhasil dibuat!');
    readln;
end;

begin
end.
