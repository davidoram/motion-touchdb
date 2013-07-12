class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    init_db
    doc = save('kerry')
    load(doc.documentID)
    test_view
    true
  end
  
  def init_db
    name = 'testdb'
    
    server = CouchTouchDBServer.sharedInstance
    if server.error
      raise "Couldn't initialise local database"
    end

    # Create the database on the first run of the app.
    @database = server.databaseNamed(name)
    error_ptr = Pointer.new(:object)
    if !@database.ensureCreated(error_ptr)
        raise "Couldn't create local database with name: #{name}. #{error_ptr[0].localizedDescription}"
    end

    @database.tracksChanges = true;

    # Initialise the views as defined in XCodeProject/CouchBaseViews
    @views = CouchBaseViews.alloc.init
    @views.useDatabase(@database)
    NSLog "init_db"
  end
  
  def save(name)
    document = @database.untitledDocument
    op = document.putProperties({'name' => name})
    if !op.wait
      raise "Couldn't save"
    end
    NSLog "save #{name}"
    document
  end

  def load(id)
    document = @database.documentWithID(id)
    NSLog "load #{document.propertyForKey('name')}"
  end

  def test_view
    # Create a few documents
    save('tom')
    save('jack')
    save('dave')
    
    # Query ordered by name
    design = @database.designDocumentWithName("default")
    query = design.queryViewNamed("byName")
    # This is where you would set up options etc 
    #options.each { |key, value| query.send("#{key}=", value) }
    for row in query.rows do
      NSLog "Query: #{row.document.propertyForKey('name')}"
    end    
  end
  
end
