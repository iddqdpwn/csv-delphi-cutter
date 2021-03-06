unit testVisualCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    Save: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
  csvFile: TextFile;
   i, j, Position, count, edt1, intCount, intPrice: integer;
   temp, tempField : string;
   FieldDel: char;
   Data: TStringList;

begin
  selectedFile := '';
  dlg := TOpenDialog.Create(self);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter := 'csv files|*.csv';
    if dlg.Execute(Handle) then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;
  if selectedFile <> '' then
  begin
    Form1.Caption := 'CSV: ' + selectedFile;
    Label4.Caption := selectedFile;
    Label4.Caption := ExtractFilePath(selectedFile);
  end;

  AssignFile(csvFile, selectedFile);
  reset(csvFile);
  CloseFile(csvFile);

//��������� StringGrid
  Data := TStringList.Create;
  FieldDel := ',';
  Data.LoadFromFile(selectedFile);
  temp :=  Data[1];
  count := 0;
  for i:= 1 to length(temp) do
    if copy(temp,i,1) =  FieldDel then
      inc(count);
  edt1 := count+1;
  StringGrid1.ColCount := 4;
  StringGrid1.Cells[0,0] := '������������ ������';
  StringGrid1.Cells[1,0] := '����';
  StringGrid1.Cells[2,0] := '���-��';
  StringGrid1.Cells[3,0] := '�����';
  StringGrid1.RowCount := Data.Count +1;
  StringGrid1.FixedCols := 0;
  for i := 0 to Data.Count - 1 do
    begin;
      temp :=  Data[i];
      if copy(temp,length(temp),1) <> FieldDel then
        temp := temp + FieldDel;
      for j := 1 to edt1 do
      begin
        Position := Pos(FieldDel,temp);
        tempField := copy(temp,0,Position-1);
        StringGrid1.Cells[j-1,i+1] := tempField;
        Delete(temp,1,length(tempField)+1);
      end;
    end;
    Data.Free;

    //��������� �����
    for i := 1 to StringGrid1.RowCount - 1 do
      begin
        StringGrid1.Cells[3,i] := (StringGrid1.Cells[1,i].ToInteger * StringGrid1.Cells[2,i].ToInteger).ToString;
      end;

    //����� ���������� �����
    Label2.Caption := '���������� �����: ' + (StringGrid1.RowCount -1).ToString ;

    //������ ����� ���������� ������
    intCount := 0;
    for i := 1 to StringGrid1.RowCount - 1 do
      begin
        intCount := intCount + StringGrid1.Cells[2,i].ToInteger();
      end;
    Label2.Caption := Label2.Caption + #13 + #10 + '����� ���������� ������: ' + intCount.ToString ;

    //������ ����� ��������� �������
    intPrice := 0;
    for i := 1 to StringGrid1.RowCount - 1 do
      begin
        intPrice := intPrice + StringGrid1.Cells[3,i].ToInteger();
      end;
    Label2.Caption := Label2.Caption + #13 + #10 + '����� ��������� ���� �������: ' + intPrice.ToString ;

end;

//���������� ��� �������� ��������
procedure myOwnSort( list : TStringList );
	const
  TheSeparator = '@';
	var
	n, i, j,v: integer;
	TempString1, TempString2, st: string;
  templist: string;

	begin
  for v := 0 to list.Count do
  begin
	for i := 0 to list.Count-2 do
	  begin
    st := list[i];
      for j:=1 to length(st) do
        begin
          if st[j]=TheSeparator then
            begin
               n:=j;  // ������ ������ ������ @ � �������� ���������� �����.
               break;
            end;
        end;

      TempString1 := Copy(list[i],1,n-1);

    st := list[i+1];
      for j:=1 to length(st)-1 do
        begin
          if st[j]=TheSeparator then
            begin
               n:=j;  // ������ ������ ������ @ � �������� ���������� �����.
               break;
            end;
        end;

    TempString2 := Copy(list[i+1],1,n-1);

      if TempString1.ToInteger() > TempString2.ToInteger() then
            begin
             tempList := list[i];
             list[i] := list[i+1];
             list[i+1] := templist;
            end;
    end;

  end;
	end;

 procedure mySortStringGrid(var GenStrGrid: TStringGrid; ThatCol: Integer);
 const
 //����������� ��� ����������
  TheSeparator = '@';
 var
   CountItem, I, J, K, ThePosition: integer;
   MyList: TStringList;
   MyString, TempString: string;
 begin
  CountItem := GenStrGrid.RowCount;
   //������ List
  MyList := TStringList.Create;
   MyList.Sorted := False;
   try
     begin
       for I := 1 to (CountItem - 1) do
         MyList.Add(GenStrGrid.Rows[I].Strings[ThatCol] + TheSeparator +
           GenStrGrid.Rows[I].Text);
     //�������� ��� ���� ���������� list
      if Form1.ComboBox1.ItemIndex = 0  then
        begin
         Mylist.Sort;
        end
        else
        begin
         myOwnSort(MyList);
        end;

        //������� ����� �� �������� �����������
       for K := 1 to Mylist.Count do
       begin
        MyString := MyList.Strings[(K - 1)];
        ThePosition := Pos(TheSeparator, MyString);
         TempString  := '';
         TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
         MyList.Strings[(K - 1)] := '';
         MyList.Strings[(K - 1)] := TempString;
       end;

       // ��������� StringGrid
      for J := 1 to (CountItem - 1) do
         GenStrGrid.Rows[J].Text := MyList.Strings[(J - 1)];
     end;
   finally
    MyList.Free;
   end;
 end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     mySortStringGrid( StringGrid1, ComboBox1.ItemIndex);

end;

procedure TForm1.SaveClick(Sender: TObject);
var
 myFile: TextFile;
 fs: TFileStream;
 csv: tstringlist;
 row, col: integer;
 s: string;
 fn: string;
 rowCountFilter: integer;

begin
  begin
    CreateDir(Label4.Caption + 'test');
    fs:=TFileStream.Create(Label4.Caption + 'test/TestResult.csv', fmCreate);
    fs.Free;
  end;
 csv:= tstringlist.create;
 rowCountFilter := StrToInt(Edit1.Text);
 for row:= 1 to (rowCountFilter + 1) do
  begin
   s:= '';
   for col:= 0 to stringgrid1.ColCount-1 do
    s:= s + stringgrid1.Cells[col, row-1] + ',';
   csv.add (s)
  end;
 fn := Label4.Caption + 'test/TestResult.csv';
 csv.savetofile (fn);
 csv.free;
 //������� ��� ���� �� �������� �����
  AssignFile(myFile, Label4.Caption + 'test/TestResult.csv');
  Append (myFile);
  WriteLn(myFile, #13#10);
  WriteLn(myFile, Label2.Caption);
  CloseFile(myFile);

 ShowMessage('���� ��������!');
end;

end.
